//::///////////////////////////////////////////////
//::q6_deekinbook
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if Player has Deekin's book from Chapter 1
*/
//:://////////////////////////////////////////////
//:: Created By:   Drew Karpyshyn
//:: Created On:   September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oBook;

    oBook = GetItemPossessedBy(GetPCSpeaker(),"bookoflegends");

    return oBook != OBJECT_INVALID;
}
