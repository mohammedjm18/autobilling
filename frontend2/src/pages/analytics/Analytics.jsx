import { Link } from 'react-router-dom';
import './Analytics.css';
import { useQuery } from 'react-query';
import Loading from '../../components/loading/Loading';
import Error from '../../components/Error/Error';

import {
    Chart as ChartJS,
    BarElement,
    CategoryScale,
    LinearScale,
    Tooltip,
    Legend
} from 'chart.js';
import { Bar } from 'react-chartjs-2';
import { getAnalytics } from '../../api/analyticsAPI';

ChartJS.register(
    BarElement,
    CategoryScale,
    LinearScale,
    Tooltip,
    Legend
)

const Analytics = () => {
    const { isLoading, isError, error, data } = useQuery('analytics', () => getAnalytics(), { retry: false, staleTime: Infinity, cacheTime: 0 });
    const chartData = {
        labels: ['Current Week', '1 Week Ago', '2 Weeks Ago', '3 Weeks Ago', '4 Weeks Ago'],
        datasets: [
            {
                label: 'Income by weeks',
                data: [0,0,0,0,0],
                barThickness: 50,
                backgroundColor: '#4c71f0',
                borderColor: '#4c71f0',
                borderWidth: 1,
            },
        ],
    };

    if(data){
        chartData.datasets[0].data = data.totalofWeeks.map(total=>+total*1000);
    }
    
    const chartOptions = {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    font: {
                        size: 16 // change font size here
                    }
                }
            },
            x: {
                ticks: {
                    font: {
                        size: 16 // change font size here
                    }
                }
            }
        },
        plugins: {
            legend: {
                labels: {
                    font: {
                        size: 16 // change font size here
                    }
                }
            }
        }
    };

    if (isLoading) return <Loading/>
    else if (isError) return <Error msg={error.msg} />
    else return (
        <div className='analytics'>
            <div className="boxes">
                <Link to={'/products'}>
                    <h2>Products</h2>
                    <span>{data.productsCount}</span>
                </Link>
                <Link to={'/orders'}>
                    <h2>Orders</h2>
                    <span>{data.ordersCount}</span>
                </Link>
                <Link to={'/orders'}>
                    <h2>Income</h2>
                    <span>{data.totalIncome} IQD</span>
                </Link>
            </div>

            <div className="chart">
                <div className="container">
                    <Bar data={chartData} options={chartOptions}></Bar>
                </div>
            </div>
        </div>
    )
}

export default Analytics;