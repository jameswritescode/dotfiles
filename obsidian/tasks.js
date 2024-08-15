const priority_weights = {
  highest: 1,
  high: 2,
  medium: 3,
  normal: 4,
  low: 5,
  lowest: 6,
};

const { filter_files = [] } = input;

dv.taskList(
  dv
    .pages("")
    .file.tasks.where((t) => {
      const name = dv.page(t.link).file.name;

      return !t.completed && t.status !== "-" && !filter_files.contains(name);
    })
    .sort((t) => {
      return priority_weights[t.priority] || priority_weights.normal;
    }),
);
