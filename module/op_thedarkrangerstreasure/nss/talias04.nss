//::///////////////////////////////////////////////
//:: Talias Conversation Script #4
//:: Talias04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the EndReady local has been set, shut down
    the module.
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
