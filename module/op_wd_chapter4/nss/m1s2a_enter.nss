void main()
{
    if(GetTag(GetEnteringObject())== "M4Q01B08LEES")
    {
        object oLeesa = GetEnteringObject();
        object oWay = GetNearestObjectByTag("WP_M4MOON_LEESA");
        AssignCommand(oLeesa,ClearAllActions());
        AssignCommand(oLeesa,ActionMoveToObject(oWay,TRUE));
        SetLocalInt(oLeesa,"NW_G_M4LEESA_FOLLOW",1);
    }
       if (GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG")) == FALSE)
       {
        AmbientSoundStop(OBJECT_SELF);
       }
}
