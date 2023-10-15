void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q0DEscape"))
    {
        //SpeakOneLinerConversation();
        ActionMoveToObject(GetNearestObjectByTag("M1Q0ToChapter1"));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
    }
}
