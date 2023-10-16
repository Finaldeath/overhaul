void main()
{
    object ofollow = GetLocalObject(OBJECT_SELF,"FOLLOW_ME");
    if (GetLocalInt(GetModule(),"FIND_DRUID1") == 1)
    {
        ActionForceMoveToObject(ofollow,TRUE, 4.5, 35.0);
    }
}
