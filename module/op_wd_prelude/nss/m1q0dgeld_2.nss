void main()
{
    object oPerceived = GetLastPerceived();
    if(GetLastPerceptionSeen())
    {
        if(GetIsPC(oPerceived) && GetLocalInt(oPerceived,"NW_L_GeldarSpoken") == FALSE)
        {
            SpeakOneLinerConversation();
        }
        else if(GetIsEnemy(oPerceived))
        {
            SpeakOneLinerConversation("M1Q0DCower");
        }
    }
}
