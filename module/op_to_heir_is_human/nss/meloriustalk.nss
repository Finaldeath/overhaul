//::///////////////////////////////////////////////
//:: Melorius Conversation Check
//:: MeloriusTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true only once Bessada has been
    defeated.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oBessada = GetObjectByTag("Bessada");

    if (GetIsObjectValid(oBessada) == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
