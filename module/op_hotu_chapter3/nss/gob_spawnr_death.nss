///////////////////////////////////////////////////////////////////////////////////
// This is the death script for the 1st goblin spawning contraption.  After 2 die,
// Podunk will change to hostile.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////


void main()
{
    object oLord = GetObjectByTag("Lord");
    int iLord = GetLocalInt(oLord, "destroyed");

   //AssignCommand(oLord, SpeakString("[NOT IN STRING EDITOR] Oooh, you're going to pay for that!"));
    SetLocalInt(oLord, "destroyed", iLord + 1);
}
