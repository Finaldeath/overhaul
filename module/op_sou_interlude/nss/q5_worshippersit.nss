void main()
{
    int nAnim = GetLocalInt(OBJECT_SELF, "ANIMATED");
    if(nAnim != 0)
    {
        object oFace = GetLocalObject(OBJECT_SELF, "FOCUS");
        ActionPlayAnimation(nAnim, 1.0, 99999.9);
        if(oFace != OBJECT_INVALID)
            SetFacingPoint(GetPosition(oFace));
    }
}
