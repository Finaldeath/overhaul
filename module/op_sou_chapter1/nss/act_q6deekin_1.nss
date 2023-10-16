//Deekin runs up right beside the PC
void main()
{
    ActionPauseConversation();
    ActionMoveToObject(GetPCSpeaker(), TRUE);
    DelayCommand(1.0, ActionResumeConversation());
}
