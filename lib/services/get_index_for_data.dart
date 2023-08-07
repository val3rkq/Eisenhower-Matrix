int getIndexForData(bool isUrgent, bool isImportant) {
  if (isUrgent) {
    return isImportant ? 1 : 3;
  } else {
    return isImportant ? 2 : 4;
  }
}