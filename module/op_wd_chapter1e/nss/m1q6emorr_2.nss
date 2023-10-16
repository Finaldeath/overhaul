void main()
{
    if(GetIsPC(GetLastPerceived()) &&
       GetLastPerceptionSeen() &&
       IsInConversation(OBJECT_SELF) == FALSE)
       {
            SpeakOneLinerConversation();
       }

}
