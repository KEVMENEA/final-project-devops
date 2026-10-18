import React from 'react';
import ReactDOM from 'react-dom/client';
import './style.css';

function App() {
  return (
    <main>
      <h1>DevOps Final Project</h1>
      <h2>ReactJS + Kubernetes + Argo CD</h2>
      <p>Application deployed automatically using GitOps.</p>
      <div className="status">✓ Deployment Successful</div>
    </main>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<App />);
