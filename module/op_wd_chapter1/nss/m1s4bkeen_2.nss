void main()
{
    PrintString("Aidan--Ran at: " +
                 IntToString(GetTimeHour()) +
                 ":" +
                 IntToString(GetTimeMinute())+
                 ":" +
                 IntToString(GetTimeSecond()) +
                 " I saw: " +
                 GetName(GetLastPerceived()));
    if(GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
        DelayCommand(20.0,ActionStartConversation(OBJECT_SELF));
}
