#include "help_general"

void main()
{
    object o = GetNearestObjectByTag("NW_NOBLMAN01");
    DestroyObject(o);

    float fDestroy = 10.0;
    object oWP = GetNearestObjectByTag("WP_CS_OP_MOVE_TO");

    o = GetNearestObjectByTag("CS_OP_HENCH_MARK");
    AssignCommand(o, ActionMoveToObject(oWP));
    DestroyObject(o, fDestroy);

    o = GetNearestObjectByTag("CS_OP_HENCH_LYEN");
    AssignCommand(o, ActionMoveToObject(oWP));
    DestroyObject(o, fDestroy);

    o = GetNearestObjectByTag("CS_OP_HENCH_KARA");
    AssignCommand(o, ActionMoveToObject(oWP));
    DestroyObject(o, fDestroy);

    o = GetNearestObjectByTag("CS_OP_HENCH_TARI");
    AssignCommand(o, ActionMoveToObject(oWP));
    DestroyObject(o, fDestroy);

    o = GetNearestObjectByTag("CS_OP_HENCH_BRUK");
    AssignCommand(o, ActionMoveToObject(oWP));
    DestroyObject(o, fDestroy);

    //The player keeps wanting to run. Slow their movement rate as a workaround.
    o = GetPCSpeaker();
    effect eWalk = EffectMovementSpeedDecrease(75);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWalk, o, 20.0);
    AssignCommand(o, ActionMoveToObject(oWP));
}
