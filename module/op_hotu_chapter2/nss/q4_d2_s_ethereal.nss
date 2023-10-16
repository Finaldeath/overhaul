//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_ETHEREALNESS
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_ETHEREALNESS)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_ETHEREALNESS
      , GetPCSpeaker()) > 0)

        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "X2_IT_SPDVSCR606");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
