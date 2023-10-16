//::///////////////////////////////////////////////
//:: M4_PLOTITEMS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adds all plot items in the game to a gnomish contraption in
    Castle Never
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    object oContraption = OBJECT_SELF;
    CreateItemOnObject("nw_it_book032",oContraption);
    CreateItemOnObject("m4q1c2_puzznotes",oContraption);
    CreateItemOnObject("m4_warzonekey",oContraption);
    CreateItemOnObject("aarin_amulet2",oContraption);
    CreateItemOnObject("aribeth_ring",oContraption);
    CreateItemOnObject("m4q1b25aribkey",oContraption);
    CreateItemOnObject("m_last_key",oContraption);
    CreateItemOnObject("maug_jour",oContraption);
    CreateItemOnObject("m4_wordofpower",oContraption);
    AssignCommand(oContraption,SpeakString("Done."));
}
