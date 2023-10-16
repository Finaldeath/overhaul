//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Ceased to Exist (Condition Script)
//:: H10c_End_Meph1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player caused
     Mephistopheles to cease to exist.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
   string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
   if (sFate == "CeaseExist" ||
        sFate == "NotCommanded")
   {
        return TRUE;
   }
   return FALSE;
}
