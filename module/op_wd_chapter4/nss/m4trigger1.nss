// * Tells the player that this is it
void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE && GetLocalInt(OBJECT_SELF,"NW_G_TRIGGER")==0)
    {
        AssignCommand(GetObjectByTag("M4Speaker"),SpeakOneLinerConversation("M4TRIGGER1"));
        DestroyObject(GetObjectByTag("M4Q1DA_PORTAL"));
        SetLocalInt(OBJECT_SELF,"NW_G_TRIGGER",1);
    }
}
