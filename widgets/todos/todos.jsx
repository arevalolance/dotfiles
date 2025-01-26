export const command = "cat ~/.config/todos/todos.txt";

export const render = ({ output, error }) => {
  // Style object for the container
  const containerStyle = {
    userSelect: 'none',
    position: 'fixed',
    bottom: '13px',
    left: '20px',
    backgroundColor: 'rgba(0, 0, 0, 0.7)',
    color: '#fff',
    padding: '10px 16px',
    borderRadius: '8px',
    fontSize: '15px',
    zIndex: 9999,
    boxShadow: '0 2px 10px rgba(0, 0, 0, 0.3)',
    backdropFilter: 'blur(4px)',
    maxWidth: '800px',
    whiteSpace: 'nowrap',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    fontFamily: "Geist Mono, monospace"
  };

  if (error) {
    return <div style={containerStyle}>Error: {String(error)}</div>;
  }

  const lines = output.split('\n');
  let currentDate = '';
  const tasks = [];

  for (const line of lines) {
    const trimmed = line.trim();
    const dateMatch = trimmed.match(/^- (\d{4}-\d{2}-\d{2})$/);
    if (dateMatch) {
      currentDate = dateMatch[1];
    } else if (trimmed.startsWith('- [ ]')) {
      if (currentDate) {
        const taskText = trimmed.substring(5).trim();
        tasks.push({
          date: currentDate,
          task: taskText,
          timestamp: Date.parse(currentDate)
        });
      }
    }
  }

  // Get today's date in YYYY-MM-DD format
  const today = new Date();
  const todayString = today.toISOString().split('T')[0]; // Use local time methods if timezone is an issue

  // Filter tasks to only those due today
  const todaysTasks = tasks.filter(task => task.date === todayString);

  if (todaysTasks.length === 0) {
    return null; // Return nothing if no tasks for today
  }

  // Display the first task due today (sorted as per the file's order)
  const latestTask = todaysTasks[0];

  return (
    <div 
      style={containerStyle}
      onMouseEnter={e => {
        e.currentTarget.style.whiteSpace = 'normal';
        e.currentTarget.style.overflow = 'visible';
      }}
      onMouseLeave={e => {
        e.currentTarget.style.whiteSpace = 'nowrap';
        e.currentTarget.style.overflow = 'hidden';
      }}
    >
      {latestTask.task}
    </div>
  );
};
