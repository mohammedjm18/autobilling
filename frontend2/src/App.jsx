import Navbar from './components/navbar/Navbar';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Analytics from './pages/analytics/Analytics';
import Products from './pages/products/Products';
import Orders from './pages/orders/Orders';
import Settings from './pages/Settings/Settings';
import EditProducts from './pages/products/edit_products/EditProducts';

const App = () => {
  return (
    <>
      <div className="App">
        <Router>
          <Routes>
            <Route element={<Navbar />}>
              <Route index element={<Analytics/>} />
              <Route path='products'>
                <Route index element={<Products/>}/>
                <Route path='edit/:id' element={<EditProducts/>}/>
              </Route>
              <Route path='orders' element={<Orders/>} />
              <Route path='settings' element={<Settings/>} />
            </Route>

            <Route path="*" element={<>redirect</>} />
          </Routes>
        </Router>
      </div>
    </>
  )
}

export default App
