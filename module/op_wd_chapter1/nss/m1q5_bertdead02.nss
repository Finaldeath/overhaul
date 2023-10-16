void main()
{
    SetLocalInt(OBJECT_SELF,"LShownMarcusJournal",1);
    SetLocalInt(OBJECT_SELF,"LMarcusDead",GetLocalInt(OBJECT_SELF,"LMarcusDead") + 1);
}

