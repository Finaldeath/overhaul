void main()
{
    if(GetIsPC(GetLastPerceived()) &&
       GetLastPerceptionSeen() &&
       GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") == 0)
    {
        SpeakOneLinerConversation();
    }
}
