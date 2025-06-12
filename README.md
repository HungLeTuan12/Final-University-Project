// Cấu trúc thư mục:
/*
src/
├── components/
│   ├── EmployeeList/
│   │   ├── EmployeeList.jsx
│   │   └── EmployeeList.css
│   └── Layout/
│       ├── Layout.jsx
│       └── Layout.css
├── store/
│   ├── index.js
│   └── slices/
│       └── employeeSlice.js
├── services/
│   └── employeeService.js
├── App.js
├── App.css
└── index.js
*/

// 1. package.json dependencies cần thiết:
/*
{
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "@reduxjs/toolkit": "^1.9.5",
    "react-redux": "^8.1.2",
    "antd": "^5.8.6",
    "axios": "^1.5.0"
  }
}
*/

// 2. src/store/index.js - ĐÂY LÀ STORE CHÍNH CỦA ỨNG DỤNG
import { configureStore } from '@reduxjs/toolkit';
import employeeReducer from './slices/employeeSlice';

export const store = configureStore({
  reducer: {
    employees: employeeReducer, // Register employee slice vào store
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: ['persist/PERSIST'],
      },
    }),
});

export default store;

// 3. src/store/slices/employeeSlice.js
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import { employeeService } from '../../services/employeeService';

// Async thunk để fetch employees với pagination
export const fetchEmployeesWithPagination = createAsyncThunk(
  'employees/fetchEmployeesWithPagination',
  async ({ page = 1, pageSize = 10 }, { rejectWithValue }) => {
    try {
      const response = await employeeService.getEmployeesWithPagination(page, pageSize);
      return response;
    } catch (error) {
      return rejectWithValue(error.message);
    }
  }
);

// Async thunk để fetch employees (toàn bộ)
export const fetchEmployees = createAsyncThunk(
  'employees/fetchEmployees',
  async (_, { rejectWithValue }) => {
    try {
      const response = await employeeService.getAllEmployees();
      return response;
    } catch (error) {
      return rejectWithValue(error.message);
    }
  }
);

const employeeSlice = createSlice({
  name: 'employees',
  initialState: {
    list: [],
    pagination: {
      current: 1,
      pageSize: 10,
      total: 0,
      totalPages: 0,
    },
    loading: false,
    error: null,
  },
  reducers: {
    clearError: (state) => {
      state.error = null;
    },
    setPagination: (state, action) => {
      state.pagination = { ...state.pagination, ...action.payload };
    },
  },
  extraReducers: (builder) => {
    builder
      // Fetch employees with pagination
      .addCase(fetchEmployeesWithPagination.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(fetchEmployeesWithPagination.fulfilled, (state, action) => {
        state.loading = false;
        state.list = action.payload.data;
        state.pagination = action.payload.pagination;
      })
      .addCase(fetchEmployeesWithPagination.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      })
      // Fetch all employees (không phân trang)
      .addCase(fetchEmployees.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(fetchEmployees.fulfilled, (state, action) => {
        state.loading = false;
        state.list = action.payload;
        // Reset pagination when loading all
        state.pagination = {
          current: 1,
          pageSize: action.payload.length,
          total: action.payload.length,
          totalPages: 1,
        };
      })
      .addCase(fetchEmployees.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      });
  },
});

export const { clearError, setPagination } = employeeSlice.actions;
export default employeeSlice.reducer;

// 4. src/services/employeeService.js
import axios from 'axios';

const API_BASE_URL = 'https://jsonplaceholder.typicode.com'; // Mock API

const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
});

export const employeeService = {
  // Lấy danh sách tất cả nhân viên (không phân trang)
  getAllEmployees: async () => {
    try {
      const response = await api.get('/users');
      // Transform data để phù hợp với employee structure
      return response.data.map(user => ({
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        company: user.company.name,
        address: `${user.address.street}, ${user.address.city}`,
        website: user.website,
      }));
    } catch (error) {
      throw new Error(error.response?.data?.message || 'Lỗi khi tải danh sách nhân viên');
    }
  },

  // Lấy danh sách nhân viên có phân trang (mock pagination)
  getEmployeesWithPagination: async (page = 1, pageSize = 10) => {
    try {
      // Lấy toàn bộ dữ liệu trước
      const response = await api.get('/users');
      const allEmployees = response.data.map(user => ({
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        company: user.company.name,
        address: `${user.address.street}, ${user.address.city}`,
        website: user.website,
      }));

      // Thực hiện pagination ở client-side
      const total = allEmployees.length;
      const startIndex = (page - 1) * pageSize;
      const endIndex = startIndex + pageSize;
      const data = allEmployees.slice(startIndex, endIndex);

      return {
        data,
        pagination: {
          current: page,
          pageSize,
          total,
          totalPages: Math.ceil(total / pageSize),
        },
      };
    } catch (error) {
      throw new Error(error.response?.data?.message || 'Lỗi khi tải danh sách nhân viên');
    }
  },
};

// 5. src/components/Layout/Layout.jsx
import React from 'react';
import { Layout as AntLayout } from 'antd';
import './Layout.css';

const { Header, Content } = AntLayout;

const Layout = ({ children }) => {
  return (
    <AntLayout className="layout">
      <Header className="header">
        <div className="logo">
          <h2>Employee Management System</h2>
        </div>
      </Header>
      <Content className="content">
        {children}
      </Content>
    </AntLayout>
  );
};

export default Layout;

// 6. src/components/Layout/Layout.css
.layout {
  min-height: 100vh;
}

.header {
  background: #001529;
  padding: 0 20px;
  display: flex;
  align-items: center;
}

.logo h2 {
  color: white;
  margin: 0;
  font-size: 20px;
}

.content {
  padding: 24px;
  background: #f0f2f5;
}

// 7. src/components/EmployeeList/EmployeeList.jsx
import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Table, Card, Button, message, Space, Tag, Switch } from 'antd';
import { ReloadOutlined, UserOutlined } from '@ant-design/icons';
import { fetchEmployees, fetchEmployeesWithPagination, clearError } from '../../store/slices/employeeSlice';
import './EmployeeList.css';

const EmployeeList = () => {
  const dispatch = useDispatch();
  const { list, pagination, loading, error } = useSelector((state) => state.employees);
  const [usePagination, setUsePagination] = useState(true);

  const loadData = (page = 1, pageSize = 10) => {
    if (usePagination) {
      dispatch(fetchEmployeesWithPagination({ page, pageSize }));
    } else {
      dispatch(fetchEmployees());
    }
  };

  useEffect(() => {
    loadData();
  }, [usePagination]);

  useEffect(() => {
    if (error) {
      message.error(error);
      dispatch(clearError());
    }
  }, [error, dispatch]);

  const handleRefresh = () => {
    loadData(pagination.current, pagination.pageSize);
  };

  const handleTableChange = (paginationInfo) => {
    if (usePagination) {
      loadData(paginationInfo.current, paginationInfo.pageSize);
    }
    // Không cần else vì khi tắt pagination thì tablePagination = false
  };

  const handlePaginationToggle = (checked) => {
    setUsePagination(checked);
  };

  const columns = [
    {
      title: 'ID',
      dataIndex: 'id',
      key: 'id',
      width: 80,
      render: (id) => <Tag color="blue">#{id}</Tag>,
    },
    {
      title: 'Tên nhân viên',
      dataIndex: 'name',
      key: 'name',
      render: (name) => (
        <Space>
          <UserOutlined />
          <span className="employee-name">{name}</span>
        </Space>
      ),
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
      render: (email) => <a href={`mailto:${email}`}>{email}</a>,
    },
    {
      title: 'Số điện thoại',
      dataIndex: 'phone',
      key: 'phone',
    },
    {
      title: 'Công ty',
      dataIndex: 'company',
      key: 'company',
      render: (company) => <Tag color="green">{company}</Tag>,
    },
    {
      title: 'Địa chỉ',
      dataIndex: 'address',
      key: 'address',
      ellipsis: true,
    },
    {
      title: 'Website',
      dataIndex: 'website',
      key: 'website',
      render: (website) => (
        <a href={`http://${website}`} target="_blank" rel="noopener noreferrer">
          {website}
        </a>
      ),
    },
  ];

  // Cấu hình pagination
  const tablePagination = usePagination ? {
    current: pagination.current,
    pageSize: pagination.pageSize,
    total: pagination.total,
    showSizeChanger: true,
    showQuickJumper: true,
    showTotal: (total, range) =>
      `${range[0]}-${range[1]} của ${total} nhân viên`,
    pageSizeOptions: ['5', '10', '20', '50'],
  } : false;

  return (
    <div className="employee-list-container">
      <Card
        title={
          <div className="card-header">
            <span>Danh sách nhân viên</span>
            <Space>
              <span>Phân trang:</span>
              <Switch
                checked={usePagination}
                onChange={handlePaginationToggle}
                checkedChildren="Bật"
                unCheckedChildren="Tắt"
              />
              <Button
                type="primary"
                icon={<ReloadOutlined />}
                onClick={handleRefresh}
                loading={loading}
              >
                Làm mới
              </Button>
            </Space>
          </div>
        }
        className="employee-card"
      >
        <Table
          columns={columns}
          dataSource={list}
          rowKey="id"
          loading={loading}
          pagination={tablePagination}
          onChange={handleTableChange}
          scroll={{ x: 1000 }}
        />
      </Card>
    </div>
  );
};

export default EmployeeList;

// 8. src/components/EmployeeList/EmployeeList.css
.employee-list-container {
  max-width: 1200px;
  margin: 0 auto;
}

.employee-card {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}

.employee-name {
  font-weight: 500;
  color: #1890ff;
}

.ant-table-thead > tr > th {
  background-color: #fafafa;
  font-weight: 600;
}

.ant-table-tbody > tr:hover > td {
  background-color: #f5f5f5;
}

// 9. src/App.js
import React from 'react';
import { Provider } from 'react-redux';
import { ConfigProvider } from 'antd';
import viVN from 'antd/locale/vi_VN';
import store from './store';
import Layout from './components/Layout/Layout';
import EmployeeList from './components/EmployeeList/EmployeeList';
import './App.css';

function App() {
  return (
    <Provider store={store}>
      <ConfigProvider locale={viVN}>
        <div className="App">
          <Layout>
            <EmployeeList />
          </Layout>
        </div>
      </ConfigProvider>
    </Provider>
  );
}

export default App;

// 10. src/App.css
.App {
  text-align: left;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

// 11. src/index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
