import React from 'react';

function App() {
  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h1 style={styles.title}>🚀 React CI/CD Pipeline</h1>
        <p style={styles.subtitle}>Deployed via AWS CodePipeline → CodeDeploy → EC2</p>
        <div style={styles.badge}>✅ Build Successful</div>
      </div>
    </div>
  );
}

const styles = {
  container: {
    minHeight: '100vh',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    background: 'linear-gradient(135deg, #0f2027, #203a43, #2c5364)',
    fontFamily: 'sans-serif',
  },
  card: {
    background: 'rgba(255,255,255,0.05)',
    border: '1px solid rgba(255,255,255,0.1)',
    borderRadius: '16px',
    padding: '48px',
    textAlign: 'center',
    color: '#fff',
  },
  title:    { fontSize: '2rem', margin: '0 0 12px' },
  subtitle: { fontSize: '1.1rem', color: '#94a3b8', margin: '0 0 24px' },
  badge: {
    display: 'inline-block',
    background: '#22c55e22',
    border: '1px solid #22c55e',
    color: '#22c55e',
    borderRadius: '999px',
    padding: '8px 24px',
    fontWeight: 600,
  },
};

export default App;
