import csv
from robot.api import logger

class CSVLibrary(object):

    def read_csv_file(self, filename):
        f = open(filename, 'r')
        csvfile = csv.reader(f)
        f.close
        return [row for row in csvfile]