void main()
{
    int nTime = GetTimeHour() + 12;

    if (nTime > 23)
    {
        nTime = nTime - 24;
    }

    SetTime(nTime,0,0,0);
}
