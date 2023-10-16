void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q4NobleQuest",10);
    SetLocalObject(OBJECT_SELF,"NW_L_M1Q4NobleQuestPC",GetPCSpeaker());
    SetCustomToken(400,GetName(GetPCSpeaker()));
}
