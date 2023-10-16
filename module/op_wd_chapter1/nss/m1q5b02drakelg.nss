void main()
{
    object oPlayer = GetPCSpeaker();
    if(GetIsObjectValid(oPlayer))
    {
        SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
        SetLocalObject(OBJECT_SELF,"NW_L_FirstSpoken",oPlayer);
        SetCustomToken(41,GetName(oPlayer));
    }
}
