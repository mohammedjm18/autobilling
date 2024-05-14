import './Orders.css';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import dayjs from 'dayjs';

import Box from '@mui/material/Box';
import Collapse from '@mui/material/Collapse';
import IconButton from '@mui/material/IconButton';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Typography from '@mui/material/Typography';
import Paper from '@mui/material/Paper';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import { TablePagination } from '@mui/material';
import { useState } from 'react';
import * as React from 'react'
import Loading from '../../components/loading/Loading';
import Error from '../../components/Error/Error';
import { getOrders } from '../../api/ordersAPI';
import { useQuery } from 'react-query';

function Row(props) {
    const { row } = props;
    const [open, setOpen] = useState(false);

    return (
        <React.Fragment>
            <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                <TableCell>
                    <IconButton
                        aria-label="expand row"
                        size="small"
                        onClick={() => setOpen(!open)}
                    >
                        {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
                    </IconButton>
                </TableCell>
                <TableCell component="th" scope="row" align="center">
                    {row.id}
                </TableCell>
                <TableCell align="center">{(row.items.reduce((a, b) => a + (b.price * 1000) * b.amount, 0).toLocaleString())}</TableCell>
                <TableCell align="center">{row.createdAt}</TableCell>
            </TableRow>
            <TableRow>
                <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
                    <Collapse in={open} timeout="auto" unmountOnExit>
                        <Box sx={{ margin: 1 }}>
                            <Table size="small" aria-label="purchases">
                                <TableHead>
                                    <TableRow>
                                        <TableCell align="center" style={{ color: '#fff' }}>Name</TableCell>
                                        <TableCell align="center" style={{ color: '#fff' }}>Amount (Kg)</TableCell>
                                        <TableCell align="center" style={{ color: '#fff' }}>Price/Kg (IQD)</TableCell>
                                        <TableCell align="center" style={{ color: '#fff' }}>Total price (IQD)</TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {row.items.map((el, i) => (
                                        <TableRow key={i}>
                                            <TableCell component="th" scope="row" align="center" style={{ color: '#fff' }}>{el.productName}</TableCell>
                                            <TableCell align="center" style={{ color: '#fff' }}>{el.amount}</TableCell>
                                            <TableCell align="center" style={{ color: '#fff' }}>{(el.price * 1000).toLocaleString()}</TableCell>
                                            <TableCell align="center" style={{ color: '#fff' }}>{(el.price * el.amount * 1000).toLocaleString()}</TableCell>
                                        </TableRow>
                                    ))}
                                </TableBody>
                            </Table>
                        </Box>
                    </Collapse>
                </TableCell>
            </TableRow>
        </React.Fragment>
    );
}

const Orders = () => {
    const [filters, setFilters] = useState({
        date: {
            from: dayjs().subtract(1, 'week'),
            to: dayjs()
        },
    });
    const { isLoading, isError, error, data } = useQuery(['orders', { from: filters.date.from, to: filters.date.to }], () => getOrders(filters.date.from, filters.date.to), { retry: false, staleTime: Infinity, cacheTime: 0 });
    const [page, setPage] = useState(0);
    const [rowsPerPage, setRowsPerPage] = React.useState(5);

    const rows = data?.orders;
    const currentRows = rows && rows.filter((r, ind) => {
        return ind >= rowsPerPage * page && ind < rowsPerPage * (page + 1);
    });
    const handleChangePage = (event, newPage) => {
        setPage(newPage);
    };

    const handleChangeRowsPerPage = (event) => {
        setRowsPerPage(parseInt(event.target.value, 10));
        setPage(0);
    };
    if (isLoading) return <Loading />
    else if (isError) return <Error msg={error.msg} />
    else return (
        <div className='orders'>
            <div className="top">
                <div className="total">
                    <div className="count">
                        Total Orders:
                        <span> {data.total.count}</span>
                    </div>
                    <div className="income">
                        Total Income:
                        <span> {(data.total.price).toLocaleString()} IQD</span>
                    </div>
                </div>
                <div className="dates">
                    <div className="date">
                        <label>From</label>
                        <DatePicker value={filters.date.from}
                            sx={{
                                "& .MuiInputLabel-root.Mui-focused": { color: "#fff" },
                                "& .MuiOutlinedInput-root": {
                                    "&:hover > fieldset": { borderColor: "#fff" },
                                    height: "48px",
                                    borderRadius: "6px",
                                    color: '#fff',
                                    "& .MuiSvgIcon-root": { // Targeting the icon
                                        color: "#fff", // Icon color
                                    },
                                },
                            }}
                            onChange={(value) => {
                                setFilters(prev => ({ ...prev, date: { to: filters.date.to, from: value } }));
                            }}
                            format="DD-MM-YYYY"
                            shouldDisableDate={(date) => {
                                return date.isAfter(filters.date.to);
                            }}
                        />
                    </div>
                    <div className="date">
                        <label>To</label>
                        <DatePicker value={filters.date.to}
                            sx={{
                                "& .MuiInputLabel-root.Mui-focused": { color: "#fff" },
                                "& .MuiOutlinedInput-root": {
                                    "&:hover > fieldset": { borderColor: "#fff" },
                                    height: "48px",
                                    borderRadius: "6px",
                                    color: '#fff',
                                    "& .MuiSvgIcon-root": { // Targeting the icon
                                        color: "#fff", // Icon color
                                    },
                                },
                            }}
                            onChange={(value) => {
                                setFilters(prev => ({ ...prev, date: { from: filters.date.from, to: value } }));
                            }}
                            format="DD-MM-YYYY"
                            shouldDisableDate={(date) => {
                                return date.isBefore(filters.date.from);
                            }}
                        />
                    </div>
                </div>

            </div>
            <div className="table">
                <div className="container">
                    <TableContainer component={Paper}>
                        <Table aria-label="collapsible table">
                            <TableHead>
                                <TableRow>
                                    <TableCell />
                                    <TableCell align="center">Order ID</TableCell>
                                    <TableCell align="center">Total Price (IQD)</TableCell>
                                    <TableCell align="center">Date</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {currentRows.map((row) => (
                                    <Row key={row.id} row={row} />
                                ))}
                            </TableBody>
                        </Table>
                        <TablePagination
                            rowsPerPageOptions={[5, 10, 25]}
                            component="div"
                            count={rows.length}
                            rowsPerPage={rowsPerPage}
                            page={page}
                            onPageChange={handleChangePage}
                            onRowsPerPageChange={handleChangeRowsPerPage}
                        />
                    </TableContainer>
                </div>
            </div>
        </div>
    )
}

export default Orders;