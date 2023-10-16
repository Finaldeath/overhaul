//Give PC Key to the fortune teller's
void main()
{
    CreateItemOnObject("q1ikey", GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q1i_Katriana_Job", 1);
}
