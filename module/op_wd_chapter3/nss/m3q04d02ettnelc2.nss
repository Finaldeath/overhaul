//* Goes and talks to the Hill Giant
void main()
{
    SetLocalObject(OBJECT_SELF, "M3Q04OETTINBLUFF", GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"M3Q4_L_TALK",1);
    ActionMoveToObject(GetNearestObjectByTag("M3Q4_D16HillGiant"));
    DelayCommand(4.0,ActionStartConversation(GetLocalObject(OBJECT_SELF,"M3Q04OETTINBLUFF")));
}

