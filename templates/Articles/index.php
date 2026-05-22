<h1>Blog Articles</h1>

<?php foreach ($articles as $article): ?>
    <article>
        <h2>
            <a href="/articles/<?= h($article->slug) ?>">
                <?= h($article->title) ?>
            </a>
        </h2>

        <p>
            <small>
                Published:
                <?= $article->created ? $article->created->format('F d, Y') : 'Sin Fecha' ?>
            </small>
        </p>

        <p><?= h($article->body) ?></p>
    </article>
<?php endforeach; ?>

<?= $this->Html->link('New Article', ['action' => 'add'], ['class' => 'button']) ?>