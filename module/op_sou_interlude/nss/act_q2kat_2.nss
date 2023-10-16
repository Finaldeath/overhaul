//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC tried to persuade Kat and give
     1 potion: Restoration.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF,"X1_KATPOTION",10);
    //CreateItemOnObject("NW_IT_MPOTION003",GetPCSpeaker());
    CreateItemOnObject("NW_IT_MPOTION011",GetPCSpeaker());
    //CreateItemOnObject("NW_IT_MPOTION009",GetPCSpeaker());
}
