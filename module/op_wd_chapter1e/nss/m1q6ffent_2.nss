void main()
{
    if(GetIsPC(GetLastPerceived()) &&
       GetLastPerceptionSeen())
    {
        DelayCommand(2.5,SpeakOneLinerConversation());
    }
}
