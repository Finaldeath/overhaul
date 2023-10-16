//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_BIGBYS_CRUSHING_HAND
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_BIGBYS_CRUSHING_HAND)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_BIGBYS_CRUSHING_HAND
      , GetPCSpeaker()) > 0)

        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "X1_IT_SPARSCR901");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
