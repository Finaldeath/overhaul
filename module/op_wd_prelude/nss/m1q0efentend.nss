void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q0End"))
    {
        object oDoor = GetNearestObjectByTag("M1Q0ToChapter1");
        object oPC = GetFirstPC();
        while( GetIsPC(oPC) )
        {
            if(GetXP(oPC) < 3000)
            {
                SetXP(oPC,3000);
                SetPanelButtonFlash(oPC,PANEL_BUTTON_CHARACTER,TRUE);
            }
            oPC = GetNextPC();
        }
        ClearAllActions();
        ActionForceMoveToObject(GetNearestObjectByTag("M1Q0ToChapter1"));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}
