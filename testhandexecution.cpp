#include "splashkit.h"

void test_proc(vector<double> &data, int idx, double value)
{
    data.push_back(value);

    if(idx >= data.size() -1)
    {
        write_line("return");
        return;
    } 
    if(idx < 0) 
    {
        write_line("set idx to 0");
        idx = 0;
    }
        

    for(int i = data.size() - 1; i > idx; i--)
    {
        write_line("changing index " + std::to_string(i) + " to " + std::to_string(data[i-1]));
        data[i] = data[i-1];
        write_line("setting index " + std::to_string(i-1) + " to " + std::to_string(value));
        data[i-1] = value;
    }
}

int main()
{
    vector<double> data;
    int idx = 0;
    double value = -4;

    data.push_back(5);
    data.push_back(-5);
    data.push_back(1);
    data.push_back(7);
    data.push_back(-2);
    
    write_line("Before");
    for(int i = 0; i < data.size(); i++)
    {
        write_line(data[i]);
    }

    test_proc(data, idx, value);

    write_line("After");
    for(int i = 0; i < data.size(); i++)
    {
        write_line(data[i]);
    }

    return 0;    
}
