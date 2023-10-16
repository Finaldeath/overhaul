//::///////////////////////////////////////////////
//::q6_deekinbook
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if Player has BURNED BOOK from library
*/
//:://////////////////////////////////////////////
//:: Created By:   Drew Karpyshyn
//:: Created On:   September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oBook;

    oBook = GetItemPossessedBy(GetPCSpeaker(),"burnedbook");

    return oBook != OBJECT_INVALID;;
}
