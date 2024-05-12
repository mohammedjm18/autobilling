import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx';

import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';

import { QueryClient, QueryClientProvider } from 'react-query';

const queryClient = new QueryClient()

ReactDOM.createRoot(document.getElementById('root')).render(
   //<React.StrictMode>
   <QueryClientProvider client={queryClient}>
      <LocalizationProvider dateAdapter={AdapterDayjs}>
         <App />
      </LocalizationProvider>
   </QueryClientProvider>
   // </React.StrictMode>
)
