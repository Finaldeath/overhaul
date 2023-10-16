//q2d_braincon_abt
//If the PC aborts conversation with the Brain - restart the conversation.
void main()
{
    object oPC = GetPCSpeaker();
    DelayCommand(0.5, ActionStartConversation(oPC));
}
