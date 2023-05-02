<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sentence start -->
<template>
    <div class="sentence row g-0 my-1 align-items-end justify-content-between shadow rounded-3 p-3">
        <input type="hidden" class="communityPostSentenceId" name="sentenceId">
        <div class="row px-0 g-0">
            <div class="col-12 col-md-6 pe-1">
                <div class="fw-bold" style="color: #2A6976;">
                    Your sentence
                </div>
                <div class="yourSentence row g-0 border p-1 rounded-1">
                    sample sample sample sample sample sample
                </div>
            </div>

            <div class="col-12 col-md-6 ps-1">
                <div class="row g-0 fw-bold align-content-center">
                    Corrected sentence
                </div>
                <div class="correctedSentence row g-0 border p-1 rounded-1">
                    sample sample sample sample sample sample
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="fw-bold mt-2" style="color: #2F4858;">Explanation</div>
            <div class="explanation border p-1 rounded-1">
                sample sample sample sample sample sample
            </div>
        </div>

    </div>
</template>
<!-- sentence end -->

<template>
    <div id="emptyNotice" class="row g-0 my-1 align-items-end justify-content-between shadow rounded-3 p-3">
        <div class="col-12">
            조건에 해당되는 문장이 없습니다.
        </div>
    </div>
</template>
    