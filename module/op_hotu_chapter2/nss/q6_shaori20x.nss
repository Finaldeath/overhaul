//::///////////////////////////////////////////////
//:: q6_Shaori20x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Set Shaori talk variable to 20 (mirror mentioned)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////


void main()
{
   if (GetLocalInt(OBJECT_SELF,"Shaori")<=20)
    {
    SetLocalInt(OBJECT_SELF,"Shaori",20);
    }
}
