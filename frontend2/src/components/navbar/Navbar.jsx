import { useEffect, useState } from 'react';
import './Navbar.css';
import { NavLink, Outlet, useLocation } from 'react-router-dom';

import DashboardIcon from '@mui/icons-material/Dashboard';
import CategoryIcon from '@mui/icons-material/Category';
import ListAltIcon from '@mui/icons-material/ListAlt';
import SettingsIcon from '@mui/icons-material/Settings';

const links = [
    {
        id: 1,
        title: 'Analytics',
        route: '/',
        icon: <DashboardIcon />
    },
    {
        id: 2,
        title: 'Products',
        route: '/products',
        icon: <CategoryIcon />
    },
    {
        id: 3,
        title: 'Orders',
        route: '/orders',
        icon: <ListAltIcon />

    },
    {
        id: 4,
        title: 'Settings',
        route: '/settings',
        icon: <SettingsIcon />
    }
]

const Navbar = () => {
    const location = useLocation();
    const [navbarIndex, setNavbarIndex] = useState(null);

    useEffect(() => {
        const path = location.pathname;
        let mainPath;
        if(path.indexOf('/',1)===-1){
            mainPath = path;
        }else{
            mainPath = path.slice(0,path.indexOf('/',1));
        }
        const index = links.findIndex(link => link.route === mainPath);
        setNavbarIndex(index);
    }, [location.pathname]);
    return (
        <div className="wrapper">
            <div className="navbar">
                <div className="logo">
                    <div className="img">
                        <img src="/logo.png" alt="" />
                    </div>
                    <h1>Auto Billing</h1>
                </div>

                <span className='line'></span>

                <div className="navlinks">
                    <span className='indicator' style={{ display: navbarIndex === null ? 'none' : 'block', transform: `translateY(${(15 + (navbarIndex * (24 + 30)))}px)` }}></span>
                    <ul>
                        {links.map(link => (
                            <li key={link.id}>
                                <NavLink to={link.route} className={({ isActive }) => isActive ? "active" : ""}>
                                    <span>{link.icon}</span>
                                    {link.title}
                                </NavLink>
                            </li>
                        ))}
                    </ul>
                </div>
            </div>
            <div className="other">
                <Outlet />
            </div>
        </div>
    )
}

export default Navbar;