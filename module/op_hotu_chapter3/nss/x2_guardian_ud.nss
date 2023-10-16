//:://////////////////////////////////////////////////
//:: X0_CH_HEN_USRDEF
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
 */
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == 20000 + ACTION_MODE_STEALTH)
    {
      int bStealth = GetActionMode(GetMaster(), ACTION_MODE_STEALTH);
      SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, bStealth);
    }
    else
    if (nEvent == 20000 + ACTION_MODE_DETECT)
    {
      int bDetect = GetActionMode(GetMaster(), ACTION_MODE_DETECT);
      SetActionMode(OBJECT_SELF, ACTION_MODE_DETECT, bDetect);
    }
    else if(nEvent == 1007) // death
    {

    }
}
