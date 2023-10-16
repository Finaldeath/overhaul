//::///////////////////////////////////////////////
//:: Dialog Speaker casts Heal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mass heal doesn't work because the speaker isn't
    friendly to the Uthgardt, just neutral.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    // * July 2 - Brent
    // * Changed to a 'cheat heal' in case you
    // * ask more than once.
    ActionCastSpellAtObject(SPELL_HEAL, GetPCSpeaker(), METAMAGIC_ANY, TRUE);
}
