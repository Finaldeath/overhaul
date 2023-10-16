void main()
{
        int nNumber = StringToInt(GetStringRight(GetTag(OBJECT_SELF),1));
        //determines target of the lightning
        if (nNumber == 5)
        {
            nNumber = 1;
        }
        else
        {
            nNumber++;
        }
        object oTarget = GetNearestObjectByTag("Ritual_Zombie" + IntToString(nNumber));
        if(GetIsObjectValid(oTarget))
        {
            DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectBeam(VFX_BEAM_COLD,OBJECT_SELF,BODY_NODE_CHEST),oTarget));
        }

}
