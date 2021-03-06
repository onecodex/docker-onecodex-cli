#!/usr/bin/env bats

@test "Python 2.7.X should be installed" {
    V=$(python --version 2>&1)
    [[ $V == Python\ 2.7* ]]
}

@test "Pigz installed" {
    V=$(pigz --version 2>&1)
    [[ $V == pigz\ 2.3* ]]
}

@test "fastq-dump v2.8.0" {
    F=$(fastq-dump --version)
    [[ $F == *2.8.0* ]]
}

@test "AWS CLI 1.8.3" {
    X=$(aws --version 2>&1)
    [[ $X == *aws-cli/1.8.3* ]]
}

@test "One Codex CLI v0.2.0a1" {
    X=$(onecodex --version 2>&1)
    [[ $X == *0.2.0-alpha1* ]]
}

@test "Join paired ends script exists" {
    X=$(python /scripts/join_paired_ends.py --help)
    [[ $X == *Join\ two\ FASTQ\ paired\ end\ read\ files.* ]]
}

@test "Join paired ends script supports interleaving" {
    X=$(python /scripts/join_paired_ends.py --help)
    [[ $X == *interleave* ]]
}