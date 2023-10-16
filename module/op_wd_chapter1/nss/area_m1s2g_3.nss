void ReturnPro(string sTag)
{
    object oPro = GetObjectByTag(sTag);
    if(GetIsObjectValid(oPro))
    {
        SetCommandable(TRUE,oPro);
        location lLoc = Location(GetObjectByTag("MAP_M1S2C"),GetPosition(oPro),GetFacing(oPro));
        effect eEffect = GetFirstEffect(oPro);
        while(GetIsEffectValid(eEffect))
        {
            if(GetEffectCreator(eEffect) == oPro)
            {
                RemoveEffect(oPro,eEffect);
            }
            eEffect = GetNextEffect(oPro);
        }
        AssignCommand(oPro,JumpToLocation(lLoc));

    }

}

void main()
{
    if(GetIsPC(GetExitingObject()))
    {
        ReturnPro("M1S2C02Tamora");
        ReturnPro("M1S2Luce");
        ReturnPro("M1S2Tanith");
    }
}
