//::///////////////////////////////////////////////
//::q6_burnedbookx
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Takes Deekin's book from player
*/
//:://////////////////////////////////////////////
//:: Created By:   Drew Karpyshyn
//:: Created On:   September 4, 2003
//:://////////////////////////////////////////////


void main()
{
    object oBook = GetItemPossessedBy(GetPCSpeaker(),"burnedbook");
    DestroyObject(oBook);
}
