void main()
{
if(GetLocalInt(OBJECT_SELF,"M2Q2WyvernBoarIsDead") == 1
   && GetLocalInt(OBJECT_SELF,"M2Q2WyvernWolfIsDead") == 1
   && GetLocalInt(OBJECT_SELF,"M2Q1WyvernSurrender") == 0)
    {
     ClearAllActions();
     SetLocalInt(OBJECT_SELF,"M2Q1WyvernSurrender",1);
     ActionStartConversation(OBJECT_SELF);
    }
}
