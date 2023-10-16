//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #12
//:: LordIridor12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If conversation ends after the player has
    declared their readiness to end the module,
    export the characters and end game.
*/
//:://////////////////////////////////////////////

void main()
{
    int iEndReady = GetLocalInt(OBJECT_SELF, "EndReady");

    if (iEndReady == TRUE)
    {
        ExportAllCharacters();
        DelayCommand(2.0, EndGame(""));
    }
}
