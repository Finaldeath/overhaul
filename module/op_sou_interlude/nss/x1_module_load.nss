
void main()
{
    SetLocalString(GetModule(),"NW_S_VERSION", "2.01");

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_TIME_JUMP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_TIME_JUMP_ONCE", 1);

    int nDay = GetCalendarDay() + 6 * 7;
    int nMonth = GetCalendarMonth();
    int nYear = GetCalendarYear();
    SetCalendar(nYear, nMonth, nDay);
    SetTime(22, 4, 41, 0);
}
